# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-pt-bin
_pkgname=betterbird
pkgver=128.10.0esr
_build=bb26
pkgrel=1
pkgdesc="PORTUGUESE // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib')
provides=("betterbird=${pkgver}")
conflicts=('betterbird')
source=(
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}.pt-BR.linux-x86_64.tar.bz2"
    "eu.betterbird.Betterbird.desktop"
)

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${_pkgname}"
    install -m644 "${srcdir}/eu.${_pkgname}.Betterbird.desktop" "${pkgdir}/usr/share/applications/eu.${_pkgname}.Betterbird.desktop"
    ln -s /opt/$_pkgname/betterbird "$pkgdir"/usr/bin/$_pkgname

    echo     "

	  >>>>>    Por favor, não se esqueça de votar neste pacote. OBRIGADO
	  >>>>>    https://aur.archlinux.org/packages/betterbird-pt-bin

	  "
    #icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('a219f787c0299c7ee52fa697cc8af30555e7b7d3465a4b2f03160ecd6eb79fbd'
            'dde5f71088162b89c7ea56508c06441e6e1e717206f781c00657cb71d96d44cd')

