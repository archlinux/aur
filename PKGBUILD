# Maintainer: ToxicTrigger <syoa1996@gmail.com>
pkgname=safeaur
pkgver=1.1.1
pkgrel=1
pkgdesc="safeaur is auto Backup and re-store System for yaourt."
url="https://github.com/ToxicTrigger/safeaur.git"
arch=('any')
depends=('yaourt>=1.6' 'pacman>=4')
makedepends=()
conflicts=()
replaces=()
backup=()

prepare()
{
  if [[ -f /bin/safeaur ]]; then
    #statements
      sudo rm /bin/safeaur
  fi
  if [[ -d /usr/src/safeaur ]]; then
    #statements
    #sudo rm /usr/src/safeaur/
    sudo rm -r /usr/src/safeaur
  fi

}

build() {
  cd /tmp
  git clone $url
  sudo mv /tmp/safeaur /usr/src/
}

package() {
  if [[ -f /bin/safeaur ]]; then
    #statements
    sudo rm /bin/safeaur
  fi
  sudo ln -s /usr/src/safeaur/safeaur.sh /bin/safeaur
}
