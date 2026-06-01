# Maintainer: Eductool <eductool.com@gmail.com>
pkgname=eductool-desktop-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="EducTool is a comprehensive and modern school management software."
arch=('x86_64')
url="https://eductool.com"
license=('MIT') 
depends=('webkit2gtk-4.1' 'gtk3' 'openssl') # Dépendances minimales requises par Tauri
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("Eductool-desktop_${pkgver}_amd64.deb::https://eductool.com/linux-deb?utm_campaign=aur_archlinux&utm_medium=linuxdeb")

# Commande 'updpkgsums' pour générer automatiquement ce hash
sha256sums=('5c2050dc096a2c25e2fcb25ed169fe145e9972f37b213680be452f2a106097bd')

package() {
  # Extraire le contenu du paquet .deb (qui contient déjà l'arborescence Linux /usr/bin...)
  # Les outils d'Arch Linux extraient automatiquement le .deb dans le dossier $srcdir
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
