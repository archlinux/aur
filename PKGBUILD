# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='dashcore'
pkgver=0.14.0.1
pkgrel=1
arch=('x86_64')
url="https://www.dash.org/"
depends=('qt5-base' 'boost' 'boost-libs' 'miniupnpc' 'openssl' 'qrencode')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'protobuf' 'qt5-tools')
license=('MIT')
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)"
provides=('dashd' 'dash-qt' 'dash-cli' 'dash-tx')
conflicts=('dashcore-git')

source=(
  'dash256.png'
  'dash-qt.desktop'
  'COPYING'
)
source=("https://github.com/dashpay/dash/releases/download/v${pkgver}/dashcore-${pkgver}-$CARCH-linux-gnu.tar.gz")
sha256sums=('c28881104ef7b3bdede7eb2b231b076a6e69213948695b4ec79ccb5621c04d97')

package() {
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-qt" "$pkgdir/usr/bin/dash-qt"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dashd" "$pkgdir/usr/bin/dashd"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-cli" "$pkgdir/usr/bin/dash-cli"
  install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-tx" "$pkgdir/usr/bin/dash-tx"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "dash256.png" "$pkgdir/usr/share/pixmaps/dash256.png"
  install -D -m644 "dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop"
}
