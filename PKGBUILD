# Maintainer: NordFlame <reinsss21@gmail.com>
pkgname=vidiorec-git
_pkgname=vidiorec
pkgver=r1.0 
pkgrel=1
pkgdesc="utilit for video recording"
arch=('any')
url="https://github.com/Ghostoraner/vidiorec"
license=('MIT')
depends=('python' 'ffmpeg') 
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Ghostoraner/vidiorec.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  
  # Встановлюємо скрипт як виконуваний файл у систему
  # Якщо файл у репозиторії називається інакше, змініть main.py на вашу назву
  install -Dm755 videorec.py "$pkgdir/usr/bin/vidiorec"
}
