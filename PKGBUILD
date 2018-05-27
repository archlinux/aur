# Maintainer: levinit <levinit@outlook.com>
pkgname=clamtk-gnome
pkgver=0.02
pkgrel=2
pkgdesc="a simple plugin for ClamTk to allow a right-click, context menu scan of files or folders in the Nautilus file manager."
arch=('any')
url="https://github.com/dave-theunsub/clamtk-gnome"
license=('GPL')
depends=('clamtk' 'python-nautilus')

source=("https://bitbucket.org/davem_/clamtk-gnome/downloads/$pkgname-$pkgver.tar.xz")
md5sums=('c2760436a48f8764f56396efeb0a4754')

#pkgver() {
#  cd "$pkgname"
#  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

package() {
    cd $pkgname-$pkgver
    install -m 755 -D ${pkgname}.py "${pkgdir}/usr/share/nautilus-python/extensions/${pkgname}.py"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
