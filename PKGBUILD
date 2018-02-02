# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=gophish
pkgver=0.5.0
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-32bit.zip")
sha512sums_i686=("3948337583e9105a7eaa394289e78e8a0957cdafb8fd5588aa2558e4eca4d56338b51a80fd3c95b877186397e904d999175bcb635789d4cee37fb9b6bb6a5a00")
source_x86_64=("https://github.com/gophish/gophish/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-64bit.zip")
sha512sums_x86_64=("9ccdc0ce0f188357259576a28ebd7bff22183479ca24f02822c173db77e8fa50c69c278213726175b2f6cca60ffef632cfd97601ef97466282f4687f6a37c0e9")
source=("gophish.service")
sha512sums=("1204011f4b5da6caa87e13a949adfb535da0535f9b50bf1ce5f88307a2275cd15ecbf873d377ed65ad6b773c0df3fe857da48a8477e2cc3570d3b403083076c6")

package() {
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/usr/share/${pkgname}
        mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
        mkdir -p ${pkgdir}/usr/lib/systemd/system
        mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

        cp -r ${srcdir}/{db,static,templates,VERSION,config.json} ${pkgdir}/usr/share/${pkgname}
        cp ${srcdir}/README.md ${pkgdir}/usr/share/doc/${pkgname}
        cp ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/gophish
        chmod +x ${srcdir}/${pkgname}
        cp ${srcdir}/${pkgname} ${pkgdir}/usr/bin
        install -m644 gophish.service ${pkgdir}/usr/lib/systemd/system
}
