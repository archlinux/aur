pkgname=apollo-studio
pkgver=1.8.16
pkgrel=1
pkgdesc="Apollo Studio - standalone editor and live playback engine for Launchpad light effects"
arch=('x86_64')
url="https://github.com/Jacobeagle/apollo-studio-build-AUR"
license=('custom')
depends=('openssl-1.1' 'dotnet-sdk-5.0-bin')
makedepends=()
source=("https://github.com/Jacobeagle/apollo-studio/releases/download/${pkgver}/apollo-studio-${pkgver}.tar.gz"
"apollo-studio.install")
sha256sums=('4a0c192d5051159d5215db298f0a7fde2fce2cdcbdbf439cc89729d206ef6c38'
            'f66e85690be8abda87ad0a220b47879bafe3990d5ec607f266834bba0a64518d')

install=apollo-studio.install

package() {
  # Tworzymy katalog docelowy w /opt i kopiujemy tam cały folder apollo-studio z rozpakowanego srcdir
  install -dm755 "$pkgdir/opt"
  cp -r "${srcdir}/apollo-studio" "$pkgdir/opt/"

  # Instalujemy plik desktop (menu)
  install -Dm644 "${srcdir}/apollo-launchpad.desktop" "$pkgdir/usr/share/applications/apollo-launchpad.desktop"

  # Instalujemy ikonę SVG
  install -Dm644 "${srcdir}/apollo-launchpad.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/apollo-studio.svg"

  # Instalujemy plik MIME
  install -Dm644 "${srcdir}/application-x-approj.xml" "$pkgdir/usr/share/mime/packages/application-x-approj.xml"

}

