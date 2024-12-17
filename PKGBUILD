# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='dashcore-bin'
_pkgname='dashcore'
pkgver=22.0.0
pkgrel=1
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)"
arch=('x86_64')
url="https://www.dash.org/"
license=('MIT')
depends=('libx11' 'fontconfig' 'xorg-fonts-misc')
makedepends=('fakeroot' 'binutils')
provides=('dashd' 'dash-qt' 'dash-cli' 'dash-tx')
conflicts=('dashcore-git' 'dashcore' 'dash-qt' 'dash-cli' 'dash-daemon')
source=('dash256.png'
        'dash-qt.desktop'
        'https://raw.githubusercontent.com/dashpay/dash/master/COPYING'
        "https://github.com/dashpay/dash/releases/download/v${pkgver}/${_pkgname}-${pkgver}-$CARCH-linux-gnu.tar.gz"{,.asc})
sha256sums=('d72bc417ed8ea88fc9eb1f32c9fe1cd58e2715ab1f75ad94d1fe6acde2af4dd9'
            '41f83cb53ecf33688d899f83e09bd52f9aa8e6d7b9b0f30810f192988b26079a'
            'ad6760db09d100e98c59b589e42166e6bfdaa5c5f4fea23c6166e378b02053ba'
            '875196fff6044cc1c713317371993c6e71c0994cbc37b8a2c57dd7616468f20f'
            'SKIP')
validpgpkeys=('29590362EC878A81FD3C202B52527BEDABE87984')

package() {
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/bin/dash-qt" "$pkgdir/usr/bin/dash-qt"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/bin/dashd" "$pkgdir/usr/bin/dashd"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/bin/dash-cli" "$pkgdir/usr/bin/dash-cli"
  install -D -m755 "$srcdir/$_pkgname-${pkgver}/bin/dash-tx" "$pkgdir/usr/bin/dash-tx"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -D -m644 "dash256.png" "$pkgdir/usr/share/pixmaps/dash256.png"
  install -D -m644 "dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop"
}
