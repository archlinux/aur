# Maintainer: Michael Thalmeier <michael AT thalmeier DOT at>
# Based on PKGBUILD from dashcore maintained by GreenRaccoon23 <GreenRaccoon23 AT gmail DOT com>

pkgname='galactrum';
pkgver=1.1.5;
pkgrel=0;
arch=('i686' 'x86_64');
url="https://www.galactrum.org/";
depends=('qt4' 'boost' 'boost-libs' 'miniupnpc' 'openssl' 'qrencode');
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'automoc4' 'protobuf');
license=('MIT');
pkgdesc="Galactrum is an autonomous self-governing digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)";
provides=('galactrumd' 'galactrum-qt' 'galactrum-cli');
conflicts=('galactrum-git');

source=(
    'galactrum256.png'
    'galactrum-qt.desktop'
    'COPYING'
);
source_i686=("https://github.com/galactrum/galactrum/releases/download/v${pkgver}/galactrum-${pkgver}-linux32.tar.gz");
source_x86_64=("https://github.com/galactrum/galactrum/releases/download/v${pkgver}/galactrum-${pkgver}-linux64.tar.gz");
sha256sums=(
    'aaf2da4aac835419a822d0315864df43f04834f3c9ab9f4f5478cf0f6e878060'
    '06cd16ebaddfc062912a8acf7a299c6317f79def5dec3ccabf4410ebd858a95a'
    'e62ea9d131dfaabd2c16c54df309839e286afe83a31403bd3db2bf78cf083486'
);
sha256sums_i686=('a813a2d8ba7ec300e8dc244eebb73e16bbc398c027cfacfacd80b741f9cb63bf');
sha256sums_x86_64=('2153efd6e65872d1910484d88f34becc7aa7b5af035447a61d498b72692aeff2');

package() {
    install -D -m755 "$srcdir/$pkgname-${pkgver}/bin/galactrum-qt" "$pkgdir/usr/bin/galactrum-qt";
    install -D -m755 "$srcdir/$pkgname-${pkgver}/bin/galactrumd" "$pkgdir/usr/bin/galactrumd";
    install -D -m755 "$srcdir/$pkgname-${pkgver}/bin/galactrum-cli" "$pkgdir/usr/bin/galactrum-cli";
    install -D -m755 "$srcdir/$pkgname-${pkgver}/bin/galactrum-tx" "$pkgdir/usr/bin/galactrum-tx";
    install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE";
    install -D -m644 "galactrum256.png" "$pkgdir/usr/share/pixmaps/galactrum256.png";
    install -D -m644 "galactrum-qt.desktop" "$pkgdir/usr/share/applications/galactrum-qt.desktop";
};
