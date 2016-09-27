#Maintainer: Janek Thomaschewski <janek@jbbr.net>

pkgname=rambox-bin
_pkgname=rambox
pkgver=0.4.4
pkgrel=1
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=('i686' 'x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'libxss' 'nss')
provides=("rambox")
url='http://rambox.pro/'
license=('MIT')
source=("${_pkgname}.sh" "${_pkgname}.desktop" "${_pkgname}.png")
source_i686=("https://github.com/saenzramiro/rambox/releases/download/$pkgver/rambox-$pkgver-ia32.tar.gz")
source_x86_64=("https://github.com/saenzramiro/rambox/releases/download/$pkgver/rambox-$pkgver-x64.tar.gz")

sha256sums=('80d75e70dc6c843c3dd3f7c4ff92d89e452814234148315348a755c330f2e902'
            '61ad70a929c402e24c79b8868208310f9b3c4d7801db2b791af38293231ee524'
            '0bf4d0c849ad6151f77b346fea0424fab910f434378f9890b16fd15a32a10064')
sha256sums_i686=('821a52acc7f4920179358501a20959050be578afdcf61c7035a9d18a583e419a')
sha256sums_x86_64=('20a622f81000c274ec2bf7f1fc7300d3905f3dbd0caaebb38bde1d19f952bc17')

package() {
    install -d ${pkgdir}/{opt/rambox,usr/{bin,share/pixmaps}}
    cp -R ${srcdir}/Rambox-${pkgver}/* ${pkgdir}/opt/${_pkgname}/
    install -Dm755 $srcdir/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 $srcdir/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
    desktop-file-install ${srcdir}/${_pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}
