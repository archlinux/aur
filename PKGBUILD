# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=intellij-http-client
pkgver=232.9559.62
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

md5sums=('140482a4ffa97fad26d3c598048f3793'
         '7c9c50bca2863eccc4ce3c37c6a2c2fd')
sha256sums=('b1bc79dad90639d9e4d0ade305810a340010391fc6690624a2b5aca4e905b214'
            '7631fff1dee9bddd5d5c4b2a6496f7095d577c72ca7cad54d7eb24b2e4302968')
