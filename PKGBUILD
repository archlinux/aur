# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=jdownloader2-jre
# The package version is the same as latest LTS Java version https://support.jdownloader.org/en/knowledgebase/article/install-jdownloader-on-nas-and-embedded-devices
pkgver=21.0.6+7
pkgrel=2
pkgdesc='Download manager, written in Java, for one-click hosting sites like Rapidshare and MEGA with bundled JRE.'
arch=('x86_64' 'aarch64')
conflicts=(jdownloader2)
provides=(jdownloader2)
url='https://jdownloader.org/'
# https://board.jdownloader.org/showthread.php?p=517795#post517795
license=('LicenseRef-GPL-3.0+proprietary')
depends=('libarchive' 'hicolor-icon-theme')
install='jdownloader.install'
source=('JDownloader'
		'JDownloaderHeadless'
		'JDownloaderHeadlessCtl'
		'functions.sh'
		'JDownloaderHeadlessCleanLogin'
		'jdownloader.xml'
		'jdownloader.desktop'
		'jd-containers.desktop'
		'jd-container16.png'
		'jd-container22.png'
		'jd-container24.png'
		'jd-container32.png'
		'jd-container48.png'
		'jd-container256.png'
		'jdownloader16.png'
		'jdownloader22.png'
		'jdownloader24.png'
		'jdownloader32.png'
		'jdownloader48.png'
		'jdownloader256.png'
		'jdownloader.service')
source_x86_64=("https://github.com/adoptium/temurin21-binaries/releases/download/jdk-${pkgver}/OpenJDK21U-jre_x64_linux_hotspot_${pkgver//+/_}.tar.gz")
source_aarch64=("https://github.com/adoptium/temurin21-binaries/releases/download/jdk-${pkgver}/OpenJDK21U-jre_aarch64_linux_hotspot_${pkgver//+/_}.tar.gz")
sha256sums=('33ec73a05ffaa7484bddffe89db6af1b059cfc67fdeb732ecd8e7595f9864650'
            'adcd9626b47a2e2a24b56fed401ff97aae361bbe45a420a66711e0c9b01a04f2'
            'dca392fad29c70eff609ec25abaefd33343c8a6c98088e0719c6746759ed0aa5'
            'ddea1dc41023cfdae4db91a23a86ebf8a6be294ee8ba59307f68f97c839d5f31'
            '1c9949bfeaf3595783eec9501e600cb8c4443e04f72d57c095560fb66dcd53d1'
            'c4301592694b3273ed44814debcc03bf1e4fc85882954f5c03e55508c53c4491'
            '44a499df472328f9034f9972aad02df0fc27a45ef1bb3e9314576d2fa9fdfcbe'
            '92cfbe543ee1f9e094347dbd9c0c6a59bd52974145f00dbece8ed0da9a828bfa'
            '16d70dfefe6d4d655313ff2784d2d259287d09634236e17a8c0ba00eac136274'
            '69d99b5d27c847eb7d99ea4e49adba2a5ac1cb12ce10eb03d38e524d6f12e234'
            '7d6073a968ff0d33a259a622ed34d8a58beb9cbdf715a8279b384546b1b4df38'
            '69ad34361769c576422bc245b910c4e0e8ed89e75435ac0a3aced9911872aaca'
            '271b10840c2d9df2c94deb28ac1477c3f3424a7cd0033e41f09615dddefa0947'
            '896eb67760bf0f3b2527b1f0cebee6cb0d16499af8961cb38bb5dca3e6d27d07'
            'b7cad9813e641eddf82571609346bb3a9cdb75e57ffa0a43fbc75721af2bc99c'
            '02ecfb160b7973f5739357e4676556a0f9e01df5b655eab40fe89f463514259a'
            'a10a45298541c025f28e9a084a87ab89a53428a00a50a9944ed3bac7978340fd'
            'cb63ab195ff1b876b668dbe518f4572971e5e0fe239a627ef67486933fcaed07'
            'b5540647f8120f723fb14747473a96e3ee031ffbc0f097e66c6cfd3431bf4e56'
            '6c7a28ec72c8627e9bf06a58d7f6bfed075632a6743e1c8087dc0fa065261504'
            'd1f54fe9bfb4f854dc20b95a61760a9f4259a1f8b125c2797a05eb3580f39a19')
sha256sums_x86_64=('7fc9d6837da5fa1f12e0f41901fd70a73154914b8c8ecbbcad2d44176a989937')
sha256sums_aarch64=('f1b78f2bd6d505d5e0539261737740ad11ade3233376b4ca52e6c72fbefd2bf6')

package() {
	install -d -m755 "${pkgdir}/opt/JDownloader"
	install -D -m755 "${srcdir}/JDownloader"                   "${pkgdir}/opt/JDownloader/JDownloader"
	install -D -m755 "${srcdir}/JDownloaderHeadless"           "${pkgdir}/opt/JDownloader/JDownloaderHeadless"
	install -D -m755 "${srcdir}/JDownloaderHeadlessCtl"        "${pkgdir}/opt/JDownloader/JDownloaderHeadlessCtl"
	install -D -m755 "${srcdir}/functions.sh"                  "${pkgdir}/opt/JDownloader/functions.sh"
	install -D -m755 "${srcdir}/JDownloaderHeadlessCleanLogin" "${pkgdir}/opt/JDownloader/JDownloaderHeadlessCleanLogin"

	install -D -m644 "${srcdir}/jdownloader.xml"       "${pkgdir}/usr/share/mime/packages/jdownloader.xml"
	install -D -m644 "${srcdir}/jdownloader.desktop"   "${pkgdir}/usr/share/applications/jdownloader.desktop"
	install -D -m644 "${srcdir}/jd-containers.desktop" "${pkgdir}/usr/share/applications/jd-containers.desktop"
	install -D -m644 "${srcdir}/jd-container16.png"    "${pkgdir}/usr/share/icons/hicolor/16x16/mimetypes/jd-container.png"
	install -D -m644 "${srcdir}/jd-container22.png"    "${pkgdir}/usr/share/icons/hicolor/22x22/mimetypes/jd-container.png"
	install -D -m644 "${srcdir}/jd-container24.png"    "${pkgdir}/usr/share/icons/hicolor/24x24/mimetypes/jd-container.png"
	install -D -m644 "${srcdir}/jd-container32.png"    "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/jd-container.png"
	install -D -m644 "${srcdir}/jd-container48.png"    "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/jd-container.png"
	install -D -m644 "${srcdir}/jd-container256.png"   "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes/jd-container.png"
	install -D -m644 "${srcdir}/jdownloader16.png"     "${pkgdir}/usr/share/icons/hicolor/16x16/apps/jdownloader.png"
	install -D -m644 "${srcdir}/jdownloader22.png"     "${pkgdir}/usr/share/icons/hicolor/22x22/apps/jdownloader.png"
	install -D -m644 "${srcdir}/jdownloader24.png"     "${pkgdir}/usr/share/icons/hicolor/24x24/apps/jdownloader.png"
	install -D -m644 "${srcdir}/jdownloader32.png"     "${pkgdir}/usr/share/icons/hicolor/32x32/apps/jdownloader.png"
	install -D -m644 "${srcdir}/jdownloader48.png"     "${pkgdir}/usr/share/icons/hicolor/48x48/apps/jdownloader.png"
	install -D -m644 "${srcdir}/jdownloader256.png"    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/jdownloader.png"
	install -D -m644 "${srcdir}/jdownloader.service"   "${pkgdir}/usr/lib/systemd/system/jdownloader.service"
	install -d -m755 "${pkgdir}/opt/JDownloader/java"
	cp -r "$srcdir/jdk-21.0.6+7-jre"/* "$pkgdir/opt/JDownloader/java"
	install -d -m2775 "${pkgdir}/opt/JDownloader"
	mkdir -p "${pkgdir}/usr/bin"

	ln -s "/opt/JDownloader/JDownloader"                   "${pkgdir}/usr/bin/JDownloader"
	ln -s "/opt/JDownloader/JDownloader"                   "${pkgdir}/usr/bin/jdownloader"
	ln -s "/opt/JDownloader/JDownloaderHeadless"           "${pkgdir}/usr/bin/JDownloaderHeadless"
	ln -s "/opt/JDownloader/JDownloaderHeadlessCtl"        "${pkgdir}/usr/bin/JDownloaderHeadlessCtl"
	ln -s "/opt/JDownloader/JDownloaderHeadlessCleanLogin" "${pkgdir}/usr/bin/JDownloaderHeadlessCleanLogin"
}
