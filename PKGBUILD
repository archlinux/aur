# Maintainer: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='dashcore';
pkgver=0.12.2.2;
pkgrel=1;
arch=('i686' 'x86_64');
url="https://www.dash.org/";
depends=('qt4' 'boost' 'boost-libs' 'miniupnpc' 'openssl' 'qrencode');
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'automoc4' 'protobuf');
license=('MIT');
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)";
provides=('dashd' 'dash-qt' 'dash-cli');
conflicts=('dashcore-git');

source=(
    'dash128.png'
    'dash-qt.desktop'
    'COPYING'
);
source_i686=("https://github.com/dashpay/dash/releases/download/v${pkgver}/dashcore-${pkgver}-linux32.tar.gz");
source_x86_64=("https://github.com/dashpay/dash/releases/download/v${pkgver}/dashcore-${pkgver}-linux64.tar.gz");
md5sums=(
    '0d4112bc393f50dc2d0f7d615aa81f39'
    '700c3a8588e7f65cdea7d433c6345ce1'
    'a959a99a436ddca2af3ddc0b428faec2'
);
sha256sums_i686=('cc1d0f6d6d7a2e64e68f23c6260eb2816f324892928686c6b0a4573941b2886b');
sha256sums_x86_64=('ce73b91536bba621dbcea4576e606bf0cd5f4b0780d85530a460982c053ed5b7');

package() {
    install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-qt" "$pkgdir/usr/bin/dash-qt";
    install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dashd" "$pkgdir/usr/bin/dashd";
    install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-cli" "$pkgdir/usr/bin/dash-cli";
    install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-tx" "$pkgdir/usr/bin/dash-tx";
    install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE";
    install -D -m644 "dash128.png" "$pkgdir/usr/share/pixmaps/dash128.png";
    install -D -m644 "dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop";
};
