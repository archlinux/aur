# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-ja-bin
_pkgname=betterbird
pkgver=128.10.0esr
_build=bb26
pkgrel=1
pkgdesc="JAPANESE // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib')
provides=("betterbird=${pkgver}")
conflicts=('betterbird')
source=(
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}.ja.linux-x86_64.tar.bz2"
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

	  >>>>>    このパッケージに忘れずに投票してください。 ありがとう
	  >>>>>    Kono pakkēji ni wasurezu ni tōhyō shite kudasai. Arigatō
	  >>>>>    https://aur.archlinux.org/packages/betterbird-ja-bin

	  "

    #icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('b0033c75fb7262f62293f6c27f29bf17eb803275a0da2c56620f0b081b1ba512'
            'dde5f71088162b89c7ea56508c06441e6e1e717206f781c00657cb71d96d44cd')

