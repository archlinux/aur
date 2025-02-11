# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=intellij-http-client
pkgver=243.23654.189
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

sha256sums=('cd8f920a350763b494c9fa1026e0ce75216c764cfa0c05e4440649915c983151'
            '7631fff1dee9bddd5d5c4b2a6496f7095d577c72ca7cad54d7eb24b2e4302968')
sha256sums=('5af59628f7bf38a97b733e6a26e0791e74178ff1d37e343d1fc83e42e0d76786'
            '7631fff1dee9bddd5d5c4b2a6496f7095d577c72ca7cad54d7eb24b2e4302968')
