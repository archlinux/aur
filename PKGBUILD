# Maintainer:  agnotek <agnostic.sn [at]gmail.com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=telegram-desktop
pkgver=0.8.38
pkgrel=1
pkgdesc="Official desktop version of Telegram messaging app."
arch=('i686' 'x86_64')
url="https://desktop.telegram.org"
license=('GPL3')
depends=('libx11' 'libgcrypt' 'libasyncns' 'libsndfile' 'libsystemd' 'libdbus' 'openal' 'libogg' 'opus' 'opusfile' 'portaudio' 'openssl' 'zlib' 'libexif' 'xz')
conflicts=('telegram-dev')
install="$pkgname.install"

if [[ $CARCH == "x86_64" ]]; then
    md5sums=('d01365d05d967185f9f56fca5eadf05b' '0f92054b498f023912e9c26654aa1904')
    source=("$pkgname-$pkgver.tar.xz"::'https://updates.tdesktop.com/tlinux/tsetup.'$pkgver'.tar.xz' 'telegram')
    
elif [[ $CARCH == "i686" ]]; then
    md5sums=('7cb592bcab97c4e3cf2a4abbed29e4aa' '0f92054b498f023912e9c26654aa1904')
    source=("$pkgname-$pkgver.tar.xz"::'https://updates.tdesktop.com/tlinux32/tsetup32.'$pkgver'.tar.xz' 'telegram')
fi

package() {

    cd "$srcdir/"
    
    install -dm755 "$pkgdir/opt/telegram/"
    install -dm755 "$pkgdir/usr/bin"

    # Program
    install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/opt/telegram/"
    install -Dm755 "$srcdir/Telegram/Updater" "$pkgdir/opt/telegram/"
    
    # Link to program
    ln -s /opt/telegram/Telegram $pkgdir/usr/bin/telegram

}

