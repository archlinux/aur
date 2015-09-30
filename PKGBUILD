# Maintainer: Vertoe <vertoe AT darkcoin DOT io>
# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Contributor: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='dashcore'
_gitname='dash'
pkgver=0.12.0.55
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.dashpay.io/"
depends=('qt4' 'boost' 'boost-libs' 'miniupnpc' 'openssl' 'qrencode')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'automoc4' 'protobuf')
license=('MIT')
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)"
provides=('dashd' 'dash-qt' 'dash-cli')
conflicts=('dashcore-git')

source=('dash128.png'
        'dash-qt.desktop'
        'COPYING'
)
source_i686=("https://www.dashpay.io/binaries/dash-$pkgver-linux32.tar.gz")
source_x86_64=("https://www.dashpay.io/binaries/dash-$pkgver-linux64.tar.gz")
md5sums=('0d4112bc393f50dc2d0f7d615aa81f39'
         '700c3a8588e7f65cdea7d433c6345ce1'
         'a959a99a436ddca2af3ddc0b428faec2')
md5sums_i686=('310bd1ed179911299f65035bbede4844')
md5sums_x86_64=('7645dbd0d41be87105c7f8dcf06ad105')

package() {
  install -D -m755 "$srcdir/$_gitname-${pkgver%.*}/bin/dash-qt" "$pkgdir/usr/bin/dash-qt"
  install -D -m755 "$srcdir/$_gitname-${pkgver%.*}/bin/dashd" "$pkgdir/usr/bin/dashd"
  install -D -m755 "$srcdir/$_gitname-${pkgver%.*}/bin/dash-cli" "$pkgdir/usr/bin/dash-cli"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "dash128.png" "$pkgdir/usr/share/pixmaps/dash128.png"
  install -D -m644 "dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop"
}
