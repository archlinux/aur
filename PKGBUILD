# Maintainer: 3ED <krzysztofas /at/ protonmail>

pkgname=(
	poc
	mp3cue mp3cut mp3length
	pob-2250 pob-3119 pob-fec
	poc-2250 poc-3119 poc-fec poc-http
	pogg-http)
pkgbase=poc
pkgdesc='a mp3 command-line editing and streaming tools'
pkgver=0.4.1
pkgrel=7
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
groups=('poc')
makedepends=('flex' 'bison')
url='https://bl0rg.net/software/poc/'
source=('https://bl0rg.net/software/poc/poc-0.4.1.tar.gz'
        'patch-x86_64.diff')
sha256sums=('a8f8be5281b80f9bb1dd0d330ec59e608d557351f6e6ad5b3d14932f7b952d29'
            '1f02a2d2db9bc2d00beeef4099df3276bc80e603c5b5aa45969d8d25f919c2b4')

prepare() {
	test "$CARCH" = "x86_64" \
		&& cd "$srcdir/$pkgbase-$pkgver" \
		&& patch -Np0 < "$srcdir/patch-x86_64.diff"
}

build() {
	cd "$srcdir/$pkgbase-$pkgver"
	make
}


package_mp3cue() {
  _pkgname=mp3cue
  pkgdesc="cut a MP3 file according to a CUE file"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_mp3cut() {
  _pkgname=mp3cut
  pkgdesc="cut and assemble MP3 files"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_mp3length() {
  _pkgname=mp3length
  pkgdesc="show the length of a MP3 file"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_pob-2250() {
  _pkgname=pob-2250
  pkgdesc="receive RTP RFC 2250 MP3 streams"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_pob-3119() {
  _pkgname=pob-3119
  pkgdesc="receive RTP RFC 3119 MP3 streams"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_pob-fec() {
  _pkgname=pob-fec
  pkgdesc="receive FEC MP3 streams"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_poc-2250() {
  _pkgname=poc-2250
  pkgdesc="send RTP RFC 2250 MP3 streams"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}-ploss" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_poc-3119() {
  _pkgname=poc-3119
  pkgdesc="send RTP RFC 3119 MP3 streams"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}-ploss" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_poc-fec() {
  _pkgname=poc-fec
  pkgdesc="send FEC MP3 streams"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}-ploss" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_poc-http() {
  _pkgname=poc-http
  pkgdesc="send HTTP MP3 streams"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
package_pogg-http() {
  _pkgname=pogg-http
  pkgdesc="send HTTP OGG streams"
  install -dm755 "$pkgdir/usr/"{bin,share/man/man1}
  install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 755 "$srcdir/$pkgbase-$pkgver/${_pkgname}" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$pkgbase-$pkgver/man/man1/${_pkgname}.1" "$pkgdir/usr/share/man/man1"
  install -m 444 "$srcdir/$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

package_poc() {
  #matapackage for backward and aur compatibility
  depends=(mp3cue mp3cut mp3length pob-2250 pob-3119 pob-fec poc-2250 poc-3119 poc-fec poc-http pogg-http)
  pkgdesc="a mp3 command-line editing and streaming tools (metapackage)"
}
