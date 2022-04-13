# Maintainer: levinit <levinit@outlook.com>
pkgname=clamtk-gnome
pkgver=6.14
pkgrel=1
pkgdesc="a simple plugin for ClamTk to allow a right-click, context menu scan of files or folders in the Nautilus file manager."
arch=('any')
url="https://github.com/dave-theunsub/clamtk-gnome"
license=('GPL')
depends=('clamtk' 'python-nautilus')

source=("https://github.com/dave-theunsub/clamtk-gnome/releases/download/v${pkgver}/clamtk-gnome-${pkgver}.tar.xz")

md5sums=('a52105400a4524ac6d9b3fc68dcef560')

#pkgver() {
#  cd "$pkgname"
#  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

package() {
    cd $pkgname-$pkgver
    install -m 755 -D ${pkgname}.py "${pkgdir}/usr/share/nautilus-python/extensions/${pkgname}.py"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
