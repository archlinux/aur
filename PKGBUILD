# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Romain Porte <microjoe@microjoe.org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=cubicsdr
pkgver=0.2.5
pkgrel=1
pkgdesc="Cross-Platform Software-Defined Radio Application"
arch=('x86_64')
options=(!strip)
url="https://github.com/cjcliffe/CubicSDR"
license=('GPL')
depends=()
optdepends=(
  'soapyrtlsdr: support for RTL-SDR (RTL2832U) dongles'
  'soapyairspy-git: support for Airspy R2 and Airspy Mini'
  'soapysdrplay-git: support for SDRplay RSP'
  'soapyhackrf-git: support for HackRF'
  'limesuite: support for LimeSDR'
  'soapylms7-git: support for LimeSDR'
  'soapyosmo: support for MiriSDR and RFSpace'
  'soapyplutosdr-git: support for PlutoSDR'
  'soapyremote: use any SoapySDR device remotely over network'
)
_file="CubicSDR-$pkgver-x86_64.AppImage"
source=("https://github.com/cjcliffe/CubicSDR/releases/download/$pkgver/$_file" "cubicsdr.desktop" "cubicsdr.png")
sha256sums=('52294f870659a1586182769446429d87a11b1821a882a67d846ca4a5170a77b4'
            '98dc7ec85637b44505cb1aa51f06fd4171c0d586968f653758fa216684d73de8'
            '063b0aeca2cf34f682bc33e9de49a704d5f8a56ba12a1acd75e7d6a2f99fe789')

build() {
	:
}

package() {
	cd $pkgdir
	install -d usr/lib/
	install -d usr/bin/
	ln -s /usr/lib/$pkgname/$_file usr/bin/$pkgname

	install -D -m755 $srcdir/$_file usr/lib/$pkgname/$_file
	install -D -m644 $srcdir/$pkgname.desktop usr/share/applications/$pkgname.desktop
	install -D -m644 $srcdir/$pkgname.png usr/share/pixmaps/$pkgname.png
}
