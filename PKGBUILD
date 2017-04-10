# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Max Roder <maxroder@web.de>

pkgname='wpscrack'
pkgver='0.1.0'
pkgrel=1
pkgdesc='PoC tool to brute force WPS - external registrar PIN of wlan access points'
#url='http://sviehb.wordpress.com'  # Upstream is dead
url='https://github.com/ml31415/wpscrack'
arch=('i686' 'x86_64')
license=('unknown')
depends=('pycrypto' 'scapy')
# NOTE: previous version can be found at https://web-beta.archive.org/web/20160517043102/http://dl.dropboxusercontent.com/u/22108808/wpscrack.zip
# Previous version SHA512 is 1b007222463103eb66fbf345b2244371d983d91129e893b668062c2e41cdb3cdec7386f3ff5a980e18e00b300486cf3e6a50070643719373029f106e95bb7ba1
source=("${pkgname}.py"
	"README.md"
	"${pkgname}.py.sig"
	"README.md.sig")
sha512sums=('129daf3f7b1d30e2a97d9b9f6d8a5849e84794e6f3c866d8a7580b0270ff34183078963540894998d95cc5f5073e4bc3b28de8f4e2d75d49fa24e609b4a2c880'
	    '05327bdf7045d7135ec3ede3c3613c112cc3d7f0fd3049308c30147116f7f99cea76e5a0e636b54fc1c7d16bce004a8ae6556af8169a608bc5c2c94bbd70cb21'
            'SKIP')

package() {
	cd ${srcdir}

	sed -i 's/python/python2/g' ${pkgname}.py

	install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
	install -Dm755 ${pkgname}.py ${pkgdir}/usr/bin/${pkgname}
}

