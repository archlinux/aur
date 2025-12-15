# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=intellij-http-client
pkgver=252.23892.409
pkgrel=1
pkgdesc="IntelliJ HTTP Client: run HTTP requests from a terminal. The binary is called ijhttp."
arch=("any")
url="https://www.jetbrains.com/help/idea/http-client-cli.html"
license=('custom')
depends=('java-runtime>=17' 'archlinux-java-run')
source=("${pkgname}-${pkgver}.zip::https://download-cdn.jetbrains.com/resources/intellij/http-client/${pkgver}/${pkgname}.zip"
         ${pkgname})

package() {
	install -Dm644 ijhttp/{License.txt,third-party-libraries.html} -t "${pkgdir}"/usr/share/licenses/${pkgname}
	install -D ijhttp/ijhttp -t "${pkgdir}"/usr/share/java/${pkgname}
	cp -r ijhttp/lib "${pkgdir}"/usr/share/java/${pkgname}
	install -D ${pkgname} "${pkgdir}"/usr/bin/ijhttp
}

sha256sums=('c841031bd3516188fc2bbfb7d850776c9faa3eb5542f4fcc31f3e8065a25e35f'
            '7631fff1dee9bddd5d5c4b2a6496f7095d577c72ca7cad54d7eb24b2e4302968')
