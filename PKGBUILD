# Maintainer: leoneii comdir@infonix.info

name=happ-desktop
pkgname=happ-desktop
url="https://github.com/Happ-proxy/happ-desktop"
pkgver=2.16.2
pkgrel=1
pkgdesc="Happ is a mobile application designed for convenient proxy server management, powered by the robust Xray core."
arch=('x86_64')
license=('custom')
source=("$pkgname-$pkgver.Happ.linux.x64.pkg.tar.zst::https://github.com/Happ-proxy/happ-desktop/releases/download/${pkgver}/Happ.linux.x64.pkg.tar.zst")
noextract=("$pkgname-$pkgver.Happ.linux.x64.pkg.tar.zst")

sha256sums=('89bee4b2c4d00406342423c3c5f75dd27c3c966776cebd9380d9bd789c04ac76')


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
  tar -xvf  "${srcdir}/$pkgname-$pkgver.Happ.linux.x64.pkg.tar.zst" -C "$pkgdir"
  cd "$pkgdir"
  
  if [ -f ".INSTALL" ]; then
    rm .INSTALL
  fi
  
  if [ -f ".MTREE" ]; then
    rm .MTREE
  fi
  
  if [ -f ".PKGINFO" ]; then
    rm .PKGINFO
  fi
  

 # echo "Extracting the data.tar.zst..."
#bsdtar -xf data.tar.zst -C "$pkgdir/
}

