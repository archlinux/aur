# Maintainer: tuberry

_srcname=fortune-zh-data
pkgname=fortune-mod-gushiwen-git
pkgver=r2.00d7cec
pkgrel=1
pkgdesc="Chinese gushiwen for fortune-mod"
url=https://github.com/shenyunhang/${_srcname}
license=(GPL3)
depends=(fortune-mod)
makedepends=(git)
provides=(fortune-mod-gushiwen)
conflicts=(fortune-mod-gushiwen)
groups=(fortune-mods)
source=(git+${url})
md5sums=(SKIP)
arch=(any)

pkgver() {
    cd ${_srcname}
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd ${_srcname}

  mv '先秦' 'Qin'
  mv '两汉' 'Han'
  mv '魏晋' 'Wei'
  mv '南北朝' 'SN'
  mv '隋代' 'Sui'
  mv '唐代' 'Tang'
  mv '五代' 'Five'
  mv '宋代' 'Song'
  mv '金朝' 'Jin'
  mv '元代' 'Yuan'
  mv '明代' 'Ming'
  mv '清代' 'Qing'
  mv '近代' 'Recent'
  mv '现代' 'Modern'
  mv '未知' 'Unknown'

  mv '先秦.dat' 'Qin.dat'
  mv '两汉.dat' 'Han.dat'
  mv '魏晋.dat' 'Wei.dat'
  mv '南北朝.dat' 'SN.dat'
  mv '隋代.dat' 'Sui.dat'
  mv '唐代.dat' 'Tang.dat'
  mv '五代.dat' 'Five.dat'
  mv '宋代.dat' 'Song.dat'
  mv '金朝.dat' 'Jin.dat'
  mv '元代.dat' 'Yuan.dat'
  mv '明代.dat' 'Ming.dat'
  mv '清代.dat' 'Qing.dat'
  mv '近代.dat' 'Recent.dat'
  mv '现代.dat' 'Modern.dat'
  mv '未知.dat' 'Unknown.dat'
}

package(){
  cd ${_srcname}
  install -dm755 ${pkgdir}/usr/share/fortune
  for file in *; do
      if [ "$file" == "LICENSE" ]; then
          continue;
      fi
      install -Dm644 $file ${pkgdir}/usr/share/fortune
  done
}
