# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=daggerfall-addons
pkgver=20110716
pkgrel=2
pkgdesc="The Elder Scrolls II: Daggerfall, unofficial Add-Ons"
arch=('any')
url="http://www.uesp.net/wiki/Daggerfall:Files#Unofficial_Add-Ons"
license=('custom:daggerfall')
depends=("daggerfall" "daggerfall-fixes")
makedepends=("unzip")
options=(!emptydirs)
install="addons.install"
source=(http://images.uesp.net//9/9d/Fixqs001.zip
        http://www.uesp.net/dagger/files/xtraqst.zip
        http://www.uesp.net/dagger/files/xtraqst2.zip
        http://images.uesp.net//0/0d/Xtraqst3.zip
        http://www.uesp.net/dagger/files/xqse.zip
        http://www.uesp.net/dagger/files/xqpatch.zip
        http://images.uesp.net//3/34/Lbsword.zip
        http://www.uesp.net/dagger/files/addtext.zip
        http://www.svatopluk.com/daggerfall/mods/BrenRSC1.zip
        http://www.svatopluk.com/daggerfall/mods/BrenRSC2.zip
        http://images.uesp.net//5/5e/MountedGuards.zip
        http://images.uesp.net//0/04/WeaponsFall.zip
        http://images.uesp.net//9/9c/ArmorFall.zip
        http://images.uesp.net//c/c3/ClothesFall.zip
        http://images.uesp.net//f/f8/WomenFall.zip
        http://www.svatopluk.com/daggerfall/mods/andyfall.zip
        andyfall-clothes.patch andyfall-armor.patch andyfall.patch)
noextract=(xtraqst.zip xtraqst2.zip Xtraqst3.zip xqse.zip xqpatch.zip Lbsword.zip
           MountedGuards.zip WeaponsFall.zip ArmorFall.zip ClothesFall.zip WomenFall.zip
           addtext.zip BrenRSC1.zip BrenRSC2.zip Fixqs001.zip)
md5sums=('4b8d31d14f3ee8c7400bdf8c9768aa1c'
         'bfda6a00f48aec717a9811debb594050'
         '2e05d882d5d3750142e5dc513064e639'
         'd10f136d77d514c1ff932fea49c9739c'
         '85b487fbbd0999660391c9e796664626'
         'b802a0e83d4c7aa707f681540758ca54'
         'fd07e8b79ec015421bae0e4ddaeee002'
         '13d33aae6edc1abaf6e060e775873588'
         '50711bb9b198972c41a9e8b9c74559ba'
         '8b585dc1c1ee47e348613dc60180720d'
         '9a27ce990dc32df5f92cb5a841b6ceaa'
         'ae5d7a13120754e3f1574767958977a7'
         '567f827b27536c740459269a02869c14'
         '3ceea5532385b3c77a5d38e971915c1e'
         '6fd1aa6fae821a86bf5f41fca20c52a7'
         '616dc4a41ca41f4e840d7d1ccbd2234f'
         '562ce2074af5bc90bc1605a47f836f32'
         '84a8c8a72c4170a2b2914b778e5d54f8'
         'e81bc2c89560d7e486a487aa1ea83264')

package() {
  cd "$srcdir"
  _target="${pkgdir}"/usr/share/games/daggerfall
  install -d -m775 "$_target"
  _target="$_target"/mods
  install -d -m775 "$_target"

  cd "$_target"
  echo "andyfall-fixes" > andyfall-lite.extends
  echo "andyfall-fixes" > andyfall.extends

  cd "$_target"
  install -d fixqs001-addons/ARENA2
  cd fixqs001-addons/ARENA2
  unzip "$srcdir"/Fixqs001.zip
  rm readme.pqs
  rm 40c00y00.qbn            
  rm 40c00y00.qrc            
  rm a0c00y12.qbn            
  rm a0c00y12.qrc            
  rm c0b00y02.qbn            
  rm c0b00y02.qrc            
  rm c0c00y10.qbn            
  rm c0c00y10.qrc            
  rm o0b00y00.qbn            
  rm o0b00y00.qrc            
  rm o0b10y00.qbn            
  rm o0b10y00.qrc            
  rm r0c30y25.qbn            
  rm r0c30y25.qrc            
  rm r0c4xy23.qbn            
  rm r0c4xy23.qrc            
  rm s0000999.qbn            
  rm s0000999.qrc            
  rm s0000007.qbn            
  rm s0000007.qrc            
  rm s0000004.qbn            
  rm s0000004.qrc     
  ls | while read file; do mv $file `echo $file | sed 's/.*/\U&/'`; done
  cd "$_target"
  echo "fixqs001-addons" > addons.extends

  cd "$_target"
  install -d extra_quests_1/ARENA2
  cd extra_quests_1/ARENA2
  unzip "$srcdir"/xtraqst.zip
  rm README.TXT
  cd "$_target"
  echo "extra_quests_1" >> addons.extends

  cd "$_target"
  install -d extra_quests_2/ARENA2
  cd extra_quests_2/ARENA2
  unzip "$srcdir"/xtraqst2.zip
  rm README.TXT
  cd "$_target"
  echo "extra_quests_2" >> addons.extends

  cd "$_target"
  install -d extra_quests_3/ARENA2
  cd extra_quests_3/ARENA2
  unzip "$srcdir"/Xtraqst3.zip
  rm README.TXT
  cd "$_target"
  echo "extra_quests_3" >> addons.extends

  cd "$_target"
  install -d extra_quests_se/ARENA2
  cd extra_quests_se/ARENA2
  unzip "$srcdir"/xqse.zip
  rm README.TXT
  cd "$_target"
  echo "extra_quests_1" > extra_quests_se.extends
  echo "extra_quests_se" >> addons.extends

  cd "$_target"
  install -d extra_quests_patch-addons/ARENA2
  cd extra_quests_patch-addons/ARENA2
  unzip "$srcdir"/xqpatch.zip
  rm PATCH.TXT
  rm Q0C00Y03.QBN            
  rm Q0C00Y03.QRC       
  cd "$_target"
  echo "extra_quests_2" > extra_quests_patch-addons.extends
  echo "extra_quests_se" >> extra_quests_patch-addons.extends
  echo "extra_quests_patch-addons" >> addons.extends

  cd "$_target"
  install -d live_by_the_sword/ARENA2
  cd live_by_the_sword/ARENA2
  unzip "$srcdir"/Lbsword.zip
  mv quests ..
  rm -rf *
  mv ../quests/* .
  rm -rf ../quests
  ls | while read file; do mv $file `echo $file | sed 's/.*/\U&/'`; done
  cd "$_target"
  echo "live_by_the_sword" >> addons.extends
  
  cd "$_target"
  install -d added_text/ARENA2
  cd added_text/ARENA2
  unzip "$srcdir"/addtext.zip
  rm text.txt
  mv Text.rsc TEXT.RSC

  cd "$_target"
  install -d brendan_text/ARENA2
  cd brendan_text/ARENA2
  unzip "$srcdir"/BrenRSC1.zip
  rm BrenRSC1.txt
  mv Brendan1.rsc TEXT.RSC

  cd "$_target"
  install -d brendan_straight_text/ARENA2
  cd brendan_straight_text/ARENA2
  unzip "$srcdir"/BrenRSC2.zip
  rm -rf __MACOSX
  mv BrenRSC2/Brendan2.rsc TEXT.RSC
  rm -rf BrenRSC2
  cd "$_target"
  echo "brendan_straight_text" >> addons.extends

  cd "$_target"
  install -d andyfall-mounted_guards/ARENA2
  cd andyfall-mounted_guards/ARENA2
  unzip "$srcdir"/MountedGuards.zip
  rm readme.txt
  rm -rf BAK
  cd "$_target"
  echo "andyfall-mounted_guards" >> andyfall-lite.extends
  echo "andyfall-mounted_guards" >> andyfall.extends
  echo "andyfall-mounted_guards" >> addons.extends

  cd "$_target"
  install -d andyfall-weapons/ARENA2
  cd andyfall-weapons/ARENA2
  unzip "$srcdir"/WeaponsFall.zip
  rm readme.txt
  rm -rf BAK
  cd "$_target"
  echo "andyfall-weapons" >> andyfall-lite.extends
  echo "andyfall-weapons" >> andyfall.extends
  echo "andyfall-weapons" >> addons.extends

  cd "$_target"
  install -d andyfall-armor/ARENA2
  cd andyfall-armor/ARENA2
  unzip "$srcdir"/ArmorFall.zip
  rm readme.txt
  rm -rf BAK
  cd "$_target"
  mv "$srcdir"/andyfall-armor.patch .
  echo "andyfall-armor" >> andyfall-lite.extends
  echo "andyfall-armor" >> andyfall.extends
  echo "andyfall-armor" >> addons.extends

  cd "$_target"
  install -d andyfall-clothes/ARENA2
  cd andyfall-clothes/ARENA2
  unzip "$srcdir"/ClothesFall.zip
  rm readme.txt
  rm -rf BAK
  cd "$_target"
  mv "$srcdir"/andyfall-clothes.patch .
  echo "andyfall-clothes" >> andyfall-lite.extends
  echo "andyfall-clothes" >> andyfall.extends
  echo "andyfall-clothes" >> addons.extends

  cd "$_target"
  install -d andyfall-women/ARENA2
  cd andyfall-women/ARENA2
  unzip "$srcdir"/WomenFall.zip
  rm readme.txt
  rm -rf BAK
  cd "$_target"
  echo "andyfall-women" >> andyfall-lite.extends
  echo "andyfall-women" >> andyfall.extends
  echo "andyfall-women" >> addons.extends

  install -d andyfall/ARENA2
  cd andyfall/ARENA2
  cp "$srcdir"/ANDYFALL/ARENA2/CLASS* .
  cd "$_target"
  echo "andyfall-lite" >> andyfall.extends
  mv "$srcdir"/andyfall.patch .
}

