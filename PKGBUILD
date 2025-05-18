# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=ungoogled-chromium-widevine-hook
pkgver=0.1.0
pkgrel=1
pkgdesc='Install latest WidewineCDM for chromium'
arch=('x86_64')
url='https://ungoogled-software.github.io/ungoogled-chromium-wiki/faq#how-do-i-install-widevine-cdm'
license=('BSD')
depends=('ungoogled-chromium' 'tar')
options=('!debug')
source=('90-ungoogled-chromium-widevine.hook'
		'ungoogled-chromium-widevine')
sha256sums=('e636d72abc917a4413a7073b6b59976934184675e986da681e2ef727f8f6fca0'
            '2a6d2acfd8a60ee330d517b5fa27b81c3ccf05ea3a970a75dc0ce4fb848aaa4c')

package() {
	# hook
	install -Dm0644 "${srcdir}/90-ungoogled-chromium-widevine.hook" "${pkgdir}/usr/share/libalpm/hooks/90-ungoogled-chromium-widevine.hook"
	# script
	install -Dm0755 "${srcdir}/ungoogled-chromium-widevine" "${pkgdir}/usr/share/libalpm/scripts/ungoogled-chromium-widevine"
}
