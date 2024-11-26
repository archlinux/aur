pkgname=openmohaa-bin
pkgver=0.80.0
pkgrel=1
pkgdesc="Open re-implementation of Medal of Honor: Allied Assault"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/openmoh/openmohaa"
license=('GPL')
depends=('sdl2' 'openal')
makedepends=('unzip')
sha256sums_x86_64=('ca0aa51cfd0495dc424611b41fe5bd1c933e66dad8410acdf9cdb91b1df1af74')
sha256sums_i686=('0db0096c9e2355a0b00349b23e63fcb64e8a1230032ca7f3e401a845295afd15')
sha256sums_armv7h=('11262853bd2855849ef1fcfdabd9545adf1ab598bc1ace1fbd8cdc40b6d1683f')
sha256sums_aarch64=('01fb7a572a795872f90ce307cc97bd1edf204babdf87967ecbdfcf4aec8a5abf')
source_x86_64=("$url/releases/download/v$pkgver/openmohaa-v$pkgver-linux-amd64.zip")
source_i686=("$url/releases/download/v$pkgver/openmohaa-v$pkgver-linux-i686.zip")
source_armv7h=("$url/releases/download/v$pkgver/openmohaa-v$pkgver-linux-armhf.zip")
source_aarch64=("$url/releases/download/v$pkgver/openmohaa-v$pkgver-linux-arm64.zip")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    
    find $srcdir -type f \( -name 'cgame.*' -o -name 'game.*' \) -exec cp -r {} "$pkgdir/usr/lib" \;
    find $srcdir -type f \( -name 'launch_openmohaa_*' -o -name 'openmohaa.*' \) -exec chmod +x {} \;
    find $srcdir -type f \( -name 'launch_openmohaa_*' -o -name 'openmohaa.*' \) -exec cp -r {} "$pkgdir/usr/bin" \;
}
