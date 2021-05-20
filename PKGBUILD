# Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgname=xiaomitool-v2
pkgver=20.7.28
pkgrel=2
pkgdesc='Modding of Xiaomi devices made easy for everyone'
arch=(any)
license=(custom)
url=https://www.xiaomitool.com/V2/
source=(
  "https://github.com/francescotescari/XMT/releases/download/v$pkgver/XMT2_Linux_$pkgver.run"
  'xiaomitool'
  'xiaomitool.appdata.xml'
  'xiaomitool.desktop'
  'xiaomitool.menu'
  'xiaomitool.xml')
sha256sums=('be7b235376c06d158c2485eebc22ba299ee784639bee52dc50e210cda206afc6'
            '9aea6eb0b9ccfdea598f8183e3a92b782b70799dd4efcc3582ff00ed134c26cc'
            '83d5fa6fbef5f42478c8c367aa5980fa9c1c2237ee43ca1d5df07f503d2a8788'
            '401d48622398b3e7af242a08d2bdb59be990720a6d2128c32ee7f2a95c6fb893'
            'b3661fde76d504c645928f4df7956b88985325b812434f43bcdde09667aa6439'
            '834a2bc636ee3d38ff8de367efec9bbb9435af463d1c2f6a84981a7f640ffa16')

package() {
  cd $srcdir
  sh "XMT2_Linux_$pkgver.run" --noexec --keep --nox11

  mkdir "$pkgdir/opt"
  mv XiaoMiTool-V2 "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  install -m755 xiaomitool "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/appdata"
  install -m644 xiaomitool.appdata.xml "$pkgdir/usr/share/appdata"
  mkdir "$pkgdir/usr/share/applications"
  install -m644 xiaomitool.desktop "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/gnome-control-center/default-apps"
  install -m644 xiaomitool.xml "$pkgdir/usr/share/gnome-control-center/default-apps"
  mkdir -p "$pkgdir/usr/share/menu"
  install -m644 xiaomitool.menu "$pkgdir/usr/share/menu"
}
