# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=gtimelog
pkgver=0.11
pkgrel=2
pkgdesc='Small GTK+ app for keeping track of your time'
arch=('any')
url='https://gtimelog.org/'
license=('GPL')
depends=('python' 'python-gobject' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/33/e5/789ef0fc2280da0ba67bae24317ee77158f23be751835c8d9dc9f0198f21/$pkgname-${pkgver}.tar.gz")
sha256sums=('ab43075afdd732e35bfc9f39ee425c23efe0f68258f3bc5688791a12028e6fc7')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  # Install .desktop file and icon(s)
  install -Dm0644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm0644 "src/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm0644 "src/${pkgname}/${pkgname}-large.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
