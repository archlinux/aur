# Maintainer: Gilwiljam <gillbilljam@gmail.com> 
pkgname=m-overlay
pkgver=2.1.8d
pkgrel=1
pkgdesc="A gamecube controller input display for use with Dolphin Emulator"
arch=('x86_64')  
url="https://github.com/bkacjios/m-overlay" 
license=('MIT') 
depends=('lua51-sec' 'libcap' 'love>=11.3') 
optdepends=('dolphin-emu: For running Gamecube and Wii games with M-Overlay' 'slippi-launcher: For running Super Smash Bros. Melee online with M-Overlay') 
source=('https://github.com/bkacjios/m-overlay/releases/latest/download/m-overlay-x64-installer.love' 
        "LICENSE::https://raw.githubusercontent.com/bkacjios/m-overlay/refs/heads/master/LICENSE" 
        'm-overlay.desktop' 
        'm-overlay.sh'
        ) 
sha256sums=('f080f25e353bc6c374c3cf2b4fa779cb1288500051af53a8d964cd4d934071f2' 'SKIP' 'SKIP' 'SKIP')  
noextract=("$pkgname-x64-installer.love")
install=m-overlay.install

package() {    
    
    install -Dm755 "$srcdir/m-overlay.sh" "$pkgdir/usr/bin/$pkgname" 
    install -Dm644 "$srcdir/m-overlay.desktop" -t "$pkgdir/usr/share/applications"  
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/m-overlay-x64-installer.love" "$pkgdir/usr/share/$pkgname/m-overlay-x64-installer.love"
}
