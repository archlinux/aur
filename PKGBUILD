# Maintainer: The Bearodactyl <dabewodactowluwu@gmail.com>

pkgname=omocep-lite
pkgver=3.9.1
pkgrel=1
pkgdesc="Installs OneLoader and OMOCEP Lite - The OMORI Community Enhancement Pack."
arch=('x86_64')
url="https://omo.cep.one/"
license=('unknown')
depends=("unzip")
conflicts=('omocep-lite-flatpak')
source=("$pkgname-$pkgver.zip"::"https://mods.one/dl/c363f38d-f50b-4e31-af3a-7dbbcd657863" 
        "https://github.com/rphsoftware/OneLoader/releases/download/v1.4/OneLoader-1.4.zip")
sha256sums=('dfac5df7bfa3567e37223a2a15401ee20d2bf8b7a766fbe0629541ae155c103f'
    'c1bc4f3831d69265d29f443d9f7c1ec24f428860b87a0de817784bad45e6a712')

prepare() {
  unzip "OneLoader-1.4.zip" -d OneLoader
  unzip "$pkgname-$pkgver.zip" -d OMOCEP-lite
}

package() {
  cp -r OneLoader/www/* "$HOME/.steam/steam/steamapps/common/OMORI/www"
  cp -fr OMOCEP-lite/www/* "$HOME/.steam/steam/steamapps/common/OMORI/www"
}
