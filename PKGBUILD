# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Pranay Kanwar <pranay.kanwar@gamil.com>

pkgname=sipcrack
pkgver=0.2
pkgrel=5
pkgdesc="A SIP protocol login cracker."
license=('custom')
url="http://www.remote-exploit.org/codes_sipcrack.html"
arch=(i686 x86_64)

source=("http://ftp.de.debian.org/debian/pool/main/s/sipcrack/${pkgname}_${pkgver}.orig.tar.gz"
        "LICENSE"
	"${pkgname}_${pkgver}.orig.tar.gz.sig"
	"LICENSE.sig")
sha512sums=('406c0f0ac4f23529e2d58f131c571492fd655d27bb466a5b972cef2c7b8ca5d550d6055ad405a4180b711a5f29027a8d47b43a912b4859ef9fccdb85069a1c45'
            '0195d97500e9a044dde046e6fbc08434d06e56b0e86c9237f4a634ef61bd864d145e9fbe445825d5e748d6c17c021ade0b4f49709c98f2b40f63aa1b96263c6f'
            'SKIP'
            'SKIP')

build() {
  cd ${srcdir}/sipcrack-${pkgver}
  make || return 1
}

package() {
  cd ${srcdir}/sipcrack-${pkgver}
  install -D -m755 sipcrack ${pkgdir}/usr/bin/sipcrack
  install -D -m755 sipdump  ${pkgdir}/usr/bin/sipdump
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
