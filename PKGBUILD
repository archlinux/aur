pkgname=apollo-studio
pkgver=1.8.16
pkgrel=2
pkgdesc="Apollo Studio - standalone editor and live playback engine for Launchpad light effects"
arch=('x86_64')
url="https://github.com/Jacobeagle/apollo-studio/"
license=('custom')
depends=('openssl-1.1' 'dotnet-sdk-5.0-bin')
makedepends=()
source=("https://github.com/Jacobeagle/apollo-studio/releases/download/${pkgver}/apollo-${pkgver}-linux.tar.gz"
"apollo-studio.install")
sha256sums=('912543917f7a0f710c081659d0dc5f6231d08df22a85388255b56db089c0eaed'
            '23b38e8e4f3a9077e229c24f462513c8b56b5a4dc27bdf77fedcccc4f4b559d8')

install=apollo-studio.install

package() {
  # Tworzymy katalog docelowy w /opt i kopiujemy tam cały folder apollo-studio z rozpakowanego srcdir
  install -dm755 "$pkgdir/opt"
  cp -r "${srcdir}/apollo-studio" "$pkgdir/opt/"

  # Instalujemy plik desktop (menu)
  install -Dm644 "${srcdir}/apollo-launchpad.desktop" "$pkgdir/usr/share/applications/apollo-launchpad.desktop"

  # Instalujemy plik MIME
  install -Dm644 "${srcdir}/application-x-approj.xml" "$pkgdir/usr/share/mime/packages/application-x-approj.xml"

}

