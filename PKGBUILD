# Maintainer: Witalij Berdinskikh <vitalij_r2@outlook.com>

pkgname=intellij-http-client
pkgver=231.9161.38
pkgrel=1
pkgdesc="IntelliJ HTTP Client: run HTTP requests from a terminal. The binary is called ijhttp."
arch=("any")
url="https://www.jetbrains.com/help/idea/http-client-cli.html"
license=('custom')
depends=('java-runtime>=17' 'archlinux-java-run')
source=("https://download-cdn.jetbrains.com/resources/intellij/http-client/${pkgver}/${pkgname}.zip"
         ${pkgname} jdk-ge-17.patch)

build() {
	patch -p0 < jdk-ge-17.patch
}

package() {
	install -Dm644 ijhttp/{License.txt,third-party-libraries.html} -t "${pkgdir}"/usr/share/licenses/${pkgname}
	install -D ijhttp/ijhttp -t "${pkgdir}"/usr/share/java/${pkgname}
	cp -r ijhttp/lib "${pkgdir}"/usr/share/java/${pkgname}
	install -D ${pkgname} "${pkgdir}"/usr/bin/ijhttp
}

md5sums=('6b53d9dc71b5c9dd19a10c895a471f5d'
         '7c9c50bca2863eccc4ce3c37c6a2c2fd'
         '20d3cf451bcd33a245a957bfbbec9b50')
sha256sums=('64d6907b41e2ba9c6f59ad7782aff96e18f2b44c53197f162f652f793e94ee9a'
            '7631fff1dee9bddd5d5c4b2a6496f7095d577c72ca7cad54d7eb24b2e4302968'
            '938214dc5b40b1c235663d76508b5f0b3c11d876ef69f22ec4fb49a8e22cb8a1')
