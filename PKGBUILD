# Maintainer: Felix Singer

pkgname=firefox-hardening
pkgver=20170309
pkgrel=1
arch=('any')
pkgdesc="Firefox hardening stuff"
license=('GPLv3')
depends=('firefox')
makedepends=()
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
url="https://github.com/ntzwrk/firefox-hardening"
source=("https://raw.githubusercontent.com/ntzwrk/firefox-hardening/fcd7066a53adc64c743c0b2e379ce4bc0ede3c0e/system-addons.sh"
	"https://raw.githubusercontent.com/ntzwrk/firefox-hardening/66bb3fdabf63057144535ca5feee584634a12dce/firefox-hardening.hook")
sha512sums=('7a5705f7e16fd8b9a2db3c6f99d7d90e4a1cb4c05974cd235dd7ce703816c08dbd36ba6da3e38a37f467a9d0ed9845e3f70fca254fcf3695abcfc03df4c16c0c'
	    '207cd94bdf50556529dde8068bb0c087aa17c9e838581395505b5a6b41a302ab08147872be0a8f67e8541c3945aafdb4d1fd131f64c31f860a68fb6350d133da')

package() {
	install -m755 -D "./system-addons.sh" "${pkgdir}/usr/lib/firefox-hardening/system-addons.sh"
	install -m644 -D "./firefox-hardening.hook" "${pkgdir}/usr/share/libalpm/hooks/firefox-hardening.hook"
}
