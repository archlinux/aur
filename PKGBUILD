# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='dashcore-bin'
_pkgname='dashcore'
pkgver=0.16.1.1
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
sha256sums=('d719e01df4b47f4d6f0d4d6eac50d402bebb4127d0b6d64764fe2a42e903819b'
            '41f83cb53ecf33688d899f83e09bd52f9aa8e6d7b9b0f30810f192988b26079a'
            'c8f1e2426af7d29fd7b22445fac83f3209962187761a0bc4abc927d6c5b6c500'
            '8803928bd18e9515f1254f97751eb6e537a084d66111ce7968eafb23e26bf3a5'
            'SKIP')
validpgpkeys=('29590362EC878A81FD3C202B52527BEDABE87984')

package() {
  install -D -m755 "$srcdir/$_pkgname-${pkgver%.*}/bin/dash-qt" "$pkgdir/usr/bin/dash-qt"
  install -D -m755 "$srcdir/$_pkgname-${pkgver%.*}/bin/dashd" "$pkgdir/usr/bin/dashd"
  install -D -m755 "$srcdir/$_pkgname-${pkgver%.*}/bin/dash-cli" "$pkgdir/usr/bin/dash-cli"
  install -D -m755 "$srcdir/$_pkgname-${pkgver%.*}/bin/dash-tx" "$pkgdir/usr/bin/dash-tx"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -D -m644 "dash256.png" "$pkgdir/usr/share/pixmaps/dash256.png"
  install -D -m644 "dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop"
}
