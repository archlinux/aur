# Maintainer: meskarune <admin@doloresportalatin.info>

pkgname=(lua-unix lua51-unix lua52-unix)
_basename=lunix
pkgver=20170920
pkgrel=0
arch=('x86_64')
url='http://25thandclement.com/~william/projects/lunix.html'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52')
source=("http://25thandclement.com/~william/projects/releases/$_basename-$pkgver.tgz")
md5sums=('e2ef87e5bfc3432127037c9228305002')

build() {
    cd "$_basename-$pkgver"
    make prefix=/usr
}

package_lua-unix() {
    pkgdesc='lua bindings library for common *nix system APIs'
    cd "$_basename-$pkgver"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    make prefix=/usr DESTDIR="$pkgdir" install5.3
}

package_lua51-unix() {
    pkgdesc='lua51 bindings library for common *nix system APIs'
    cd "$_basename-$pkgver"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    make prefix=/usr DESTDIR="$pkgdir" install5.1
}

package_lua52-unix() {
    pkgdesc='lua52 bindings library for common *nix system APIs'
    cd "$_basename-$pkgver"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    make prefix=/usr DESTDIR="$pkgdir" install5.2
}
