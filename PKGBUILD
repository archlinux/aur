# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=vdu_controls
pkgver=2.5.0
pkgrel=1
pkgdesc="Visual Display Unit virtual control panel - a GUI front end to ddcutil"
arch=('any')
url="https://github.com/digitaltrails/vdu_controls"
license=('GPL-3.0-or-later')
depends=(
  'ddcutil'
  'hicolor-icon-theme'
  'noto-fonts'
  'python-pyqt6'
  'qt6-svg'
)
optdepends=(
  'ddcutil-service: D-Bus Interface for up to 10x faster response times.'
  'python-pyserial: If you wish to use a serial-port lux metering device'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8a692e175b530bc02ec5f8cb9f363b63483ba36f27f8ba13aea7cb3e5af6cc3e')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 translations/*.{ts,txt} -t "$pkgdir/usr/share/$pkgname/translations/"
  install -Dm755 sample-scripts/* -t "$pkgdir/usr/share/$pkgname/sample-scripts/"
  install -Dm644 icons/* -t "$pkgdir/usr/share/$pkgname/icons/"
  install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
