# Maintainer: Trần Đức Nam <dynamo.foss@gmail.com>
# Contributor: Lê Quốc Tuấn <mr.lequoctuan@gmail.com>
pkgbase=stardict-vi
# You can choose dictionary to install by the way comment out it
listdict=(
  # English
  'vi-en'
  'en-vi'

  # Japanese
  'vi-ja'
  'ja-vi'

  # Chinese
  'zh-vi'

  # French
  'fr-vi'
  'vi-fr'

  # Spanish
  'es-vi'
  'vi-es'

  # Deutsch
  'de-vi'
  'vi-de'

  # Korean
  'ko-vi'
  'vi-ko'

  # Russian
  'ru-vi'
  'vi-ru'

  # Czech
  'cz-vi'

  # Italian
  'it-vi'

  # Norway
  'no-vi'

  # Portugal
  'pt-vi'
)
true && pkgname=()
for basecode in "${listdict[@]}"; do
  true && pkgname+=("stardict-${basecode}")
done
pkgver=1.0
pkgrel=1
pkgdesc="OVDP Vietnamese dict (Stardict format)"
groups=('stardict-vi')
arch=('any')
url='http://ovdp.sourceforge.net'
license=("GPL")
source=("git+https://github.com/dynamotn/${pkgbase}.git")
md5sums=('SKIP')

for basecode in "${listdict[@]}"; do
  eval "package_stardict-$basecode() {
    cd \$srcdir/$pkgbase/$basecode
    mkdir -p \$pkgdir/usr/share/stardict/dic/ovdp-$basecode
    cp * \$pkgdir/usr/share/stardict/dic/ovdp-$basecode
  }"
done
