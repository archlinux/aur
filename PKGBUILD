pkgname=apollo-studio
pkgver=1.8.16
pkgrel=1
pkgdesc="Apollo Studio - audio project editor"
arch=('x86_64')
url="https://github.com/Jacobeagle/apollo-studio-build-AUR"
license=('custom')
depends=('openssl-1.1' 'dotnet-sdk-5.0-bin')
makedepends=()
source=("https://github.com/Jacobeagle/apollo-studio-build-AUR/releases/download/${pkgver}/apollo-studio-${pkgver}.tar.gz")
sha256sums=('dc0ebc4eb80e6f2618178af7376c7f4f226d3a5633467bdcfab071871cec9a7d')

install=apollo-studio.install

package() {
  # Tworzymy katalog docelowy w /opt i kopiujemy tam cały folder apollo-studio z rozpakowanego srcdir
  install -dm755 "$pkgdir/opt"
  cp -r "${srcdir}/apollo-studio" "$pkgdir/opt/"

  # Instalujemy plik desktop (menu)
  install -Dm644 "${srcdir}apollo-launchpad.desktop" "$pkgdir/usr/share/applications/apollo-launchpad.desktop"

  # Instalujemy ikonę SVG
  install -Dm644 "${srcdir}apollo-studio.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/apollo-studio.svg"

  # Instalujemy plik MIME
  install -Dm644 "${srcdir}application-x-approj.xml" "$pkgdir/usr/share/mime/packages/application-x-approj.xml"
}

