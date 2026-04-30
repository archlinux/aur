# Maintainer: Gabriele Granato <tuo-email-se-vuoi@esempio.com>
pkgname=apt-fake-ubuntu
pkgver=1.2
pkgrel=1
pkgdesc="A smart APT wrapper for Arch Linux with GUI, Auto-Repair, and ARM support. Perfect for Ubuntu refugees!"
arch=('any')
url="https://github.com/castielloangela512-ai/apt-fake"
license=('GPL')
depends=('bash' 'pacman' 'zenity')
optdepends=('yay: AUR support (recommended)' 
            'paru: alternative AUR support'
            'upower: for battery status command')
source=("apt-fake" 
        "apt-fake.desktop")
sha256sums=('14cc1a887206676c234fe3869610fed6a26603c6c5269eee59b63e02404845cd'
            '65aaf1cb417998cb2e10d50efbe0f25dcb9027770c4348735955d5203ee10c4d')

package() {
    # 1. Installa lo script principale in /usr/bin/apt
    # Così puoi scrivere semplicemente 'apt' nel terminale
    install -Dm755 "${srcdir}/apt-fake" "${pkgdir}/usr/bin/apt"

    # 2. Installa il file Desktop per far apparire l'icona nel menu GNOME
    install -Dm644 "${srcdir}/apt-fake.desktop" "${pkgdir}/usr/share/applications/apt-fake.desktop"
    
    # 3. (Opzionale) Se vuoi aggiungere un'icona specifica, dovresti aggiungerla qui
    # Per ora usiamo un'icona di sistema standard chiamata 'system-software-install'
}
