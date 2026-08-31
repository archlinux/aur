# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-pt-bin
_pkgname=betterbird
pkgver=153.2.0esr
_build=bb8
pkgrel=1
pkgdesc="PORTUGUESE // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib')
provides=("betterbird=${pkgver}")
conflicts=('betterbird')
source=(
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver}-${_build}.pt-BR.linux-x86_64.tar.xz"
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
sha256sums=('25c50aeb458ed00d5c1e29289f7ef40cb889ab80b6946dd600787e863783d326'
            '5ebc00bff424b0badcdb60f87db1c809a2a691d3634720e11c51b42df1e523a6')

