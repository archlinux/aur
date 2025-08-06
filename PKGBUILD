pkgname=apollo-studio
pkgver=1.8.16
pkgrel=3
pkgdesc="Apollo Studio - standalone editor and live playback engine for Launchpad light effects"
arch=('x86_64')
url="https://github.com/Jacobeagle/apollo-studio/"
license=('custom')
depends=('openssl-1.1' 'dotnet-sdk-5.0-bin')
makedepends=()
source=("https://github.com/Jacobeagle/apollo-studio/releases/download/${pkgver}/apollo-${pkgver}-linux.tar.gz"
"apollo-studio.install")
sha256sums=('1d60ef3b80b897ff0185c4b4508a9d29195cf5dd2ded3ac0f812b480652e65f3'
            '9193c7d64062e1c7dd5452f4b726ead6a2db9e5e28c6a15173dc0b9228b76340')

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

