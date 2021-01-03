# Maintainer: Joznia <jz.joznia@protonmail.com>
pkgname=jza
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple AUR helper written in Bash"
arch=('x86_64')
url="https://gitlab.com/joznia/jza"
license=('GPL2')
depends=('git' 'wget')
source=("https://gitlab.com/joznia/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
md5sums=('e11ec2488d94a88b163e7a1d0b9df67e')

prepare() {
    tar xpf "$pkgname-v$pkgver.tar.bz2"
}

package() {
    mkdir -p "${pkgdir}/usr/share/licenses/$pkgname/"

	cd "$pkgname-v$pkgver"

    install -Dm644 "./LICENSE" \
    "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "./$pkgname.bash" \
    "${pkgdir}/usr/bin/$pkgname"
}
