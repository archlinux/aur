# Maintainer: ToxicTrigger <syoa1996@gmail.com>
pkgname=safeaur
pkgver=1.0.0
pkgrel=1
pkgdesc="safeaur is auto Backup and re-store System for yaourt."
url="https://github.com/ToxicTrigger/safeaur.git"
arch=('any')
#license=('GPL3')
depends=('yaourt>=1.6' 'pacman>=4')
#optdepends=('')
makedepends=()
conflicts=()
replaces=()
backup=()

#install='foo.install'
#source=("http://www.server.tld/${pkgname}-${pkgver}.tar.gz"
#        "foo.desktop")
#md5sums=('31790D3E7DFA3A13C0990B17339CBB6C')

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

  if [[ -d /tmp/safeaur ]]; then
    sudo rm -r /tmp/safeaur
  fi

}

build() {
  cd /tmp
  git clone $url
  sudo cp -r /tmp/safeaur /usr/src
}

package() {
  if [[ -f /bin/safeaur ]]; then
    #statements
    sudo rm /bin/safeaur
  fi
  sudo ln -s /usr/src/safeaur/safeaur.sh /bin/safeaur
}
