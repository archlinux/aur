# Maintainer: GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='dashcore';
pkgver=0.12.2.2;
pkgrel=2;
arch=('i686' 'x86_64');
url="https://www.dash.org/";
depends=('qt4' 'boost' 'boost-libs' 'miniupnpc' 'openssl' 'qrencode');
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'automoc4' 'protobuf');
license=('MIT');
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)";
provides=('dashd' 'dash-qt' 'dash-cli');
conflicts=('dashcore-git');

source=(
    'dash256.png'
    'dash-qt.desktop'
    'COPYING'
);
source_i686=("https://github.com/dashpay/dash/releases/download/v${pkgver}/dashcore-${pkgver}-linux32.tar.gz");
source_x86_64=("https://github.com/dashpay/dash/releases/download/v${pkgver}/dashcore-${pkgver}-linux64.tar.gz");
sha256sums=(
    'd719e01df4b47f4d6f0d4d6eac50d402bebb4127d0b6d64764fe2a42e903819b'
    '41f83cb53ecf33688d899f83e09bd52f9aa8e6d7b9b0f30810f192988b26079a'
    'b5290c16b194d488265f3af37a7ab74cb9fecea2de97b910670cefa4e0909853'
);
sha256sums_i686=('cc1d0f6d6d7a2e64e68f23c6260eb2816f324892928686c6b0a4573941b2886b');
sha256sums_x86_64=('ce73b91536bba621dbcea4576e606bf0cd5f4b0780d85530a460982c053ed5b7');

package() {
    install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-qt" "$pkgdir/usr/bin/dash-qt";
    install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dashd" "$pkgdir/usr/bin/dashd";
    install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-cli" "$pkgdir/usr/bin/dash-cli";
    install -D -m755 "$srcdir/$pkgname-${pkgver%.*}/bin/dash-tx" "$pkgdir/usr/bin/dash-tx";
    install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE";
    install -D -m644 "dash256.png" "$pkgdir/usr/share/pixmaps/dash256.png";
    install -D -m644 "dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop";
};
