# Maintainer: zekeer <isoniasid@gmail.com>
pkgname=bomi-fresh
pkgver=0.9.11
pkgrel=1
pkgdesc="Powerful and easy-to-use GUI multimedia player based on mpv"
arch=('any')
url="http://bomi-player.github.io"
license=('GPL')
provides=('cmplayer')
depends=('qt5-base' 'qt5-declarative' 'qt5-x11extras' 'qt5-quickcontrols' 'qt5-svg'
         'libdvdread' 'libdvdnav' 'libcdio-paranoia' 'libcdio' 'smbclient'
         'alsa-lib' 'libpulse' 'jack' 'libbluray'
         'libva' 'libvdpau' 'libgl' 'libchardet-fresh' 'fribidi' 'libass' 'ffmpeg')
optdepends=('libva-intel-driver: hardware acceleration support for Intel GPU'
            'mesa-vdpau: hardware acceleration support for AMD/NVIDIA opensource driver'
            'youtube-dl: streaming website support including YouTube'
            'libaacs: AACS decryption for Blu-ray support'
            'libbdplus: BD+ decryption for Blu-ray support')
if [ "$(uname -m)" == "i686" ]; then  ## convert bit architecture to bomi format
  arch_mod='i686';
  md5sums+=('611fce21f4d5151a532e1f7a48eb5bb5');
  source+=("https://manjaro.ru/aur/$pkgname/bomi-$pkgver-$pkgrel.$arch_mod.rpm")
 else
  arch_mod='x86_64';
  md5sums+=('711ccf0c25708abfbe4238dfd4b5d9fe')
  source+=("https://manjaro.ru/aur/$pkgname/bomi-$pkgver-$pkgrel.$arch_mod.rpm")
fi;
package() {

        cd "$srcdir/"
        # Creating needed directories
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share"

        # Copy files
        cp -r "$srcdir/usr/bin" "$pkgdir/usr"
        cp -r "$srcdir/usr/share" "$pkgdir/usr"     
}

