# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=intellij-http-client
pkgver=241.18034.62
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

md5sums=('0bb9a8c6a5d085b21a7cb147408df473'
         '7c9c50bca2863eccc4ce3c37c6a2c2fd')
sha256sums=('98d5d0a75608a1cc202a3d236e6efe52e4f38700b1112acc5157c57d2407a0a7'
            '7631fff1dee9bddd5d5c4b2a6496f7095d577c72ca7cad54d7eb24b2e4302968')
