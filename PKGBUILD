# Maintainer: leoneii comdir@infonix.info

name=happ-desktop
pkgname=happ-desktop
url="https://github.com/Happ-proxy/happ-desktop"
pkgver=2.6.0
pkgrel=1
pkgdesc="Happ is a mobile application designed for convenient proxy server management, powered by the robust Xray core."
arch=('x86_64')
license=('custom')
source=("https://github.com/Happ-proxy/happ-desktop/releases/download/${pkgver}/Happ.linux.x64.pkg.tar.zst")
noextract=("Happ.linux.x64.pkg.tar.zst")
sha256sums=('677d2d772f1033571b35aa1081e76964806fe4217b2d558fed10cf34a6c922e3')


makedepends=(
)
depends=(
)

build() {
  echo "Skiping build....."
  # Извлекаем содержимое RPM
 # rpm2cpio "$srcdir/chromium-gost-${pkgver}-linux-amd64.rpm" | cpio -id -m -P  # -P - это чтобы не удаляло символические ссылки
  # Дополнительные шаги по сборке, если необходимо
  # Например, копируем файлы из извлеченного RPM в каталог сборки
 # mv ./your-package-directory/ /path/to/your/build/directory
  # Запускаем скрипты установки, если необходимо
  # ./configure
  # make
}

package() {
  #cd "$srcdir"
  tar -xvf "${srcdir}/Happ.linux.x64.pkg.tar.zst" -C "${pkgdir}"
  cd "$pkgdir"
  
  rm .INSTALL
  rm .MTREE
  rm .PKGINFO
 # pacman -U --noconfirm ./Happ.linux.x64.pkg.tar.zst
  # Копируем необходимые файлы в каталог пакета
 # echo "Extracting the data.tar.zst..."
#bsdtar -xf data.tar.zst -C "$pkgdir/"
}

