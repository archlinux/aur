# Maintainer: Alexander Peltzer ("alexpe87") <alexpe.aur@mailbox.org>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=picard-tools
pkgver=2.23.8
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(x86_64)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime>=8')
#makedepends=(gradle)

#source=("git+https://github.com/broadinstitute/picard.git#tag=${pkgver}")

source=("$pkgname-$pkgver.jar::https://github.com/broadinstitute/picard/releases/download/$pkgver/picard.jar"
        'picard-profile.sh'
        'picard.sh')
noextract=("$pkgname-$pkgver.jar")
md5sums=('3d7c2d5fa33063bbd4b656099359cde0'
         'ebcda2d2c55df6d05994252cf22a68c2'
         '0987aa56f62f5e843bfa788cc93626c8')

#build() {
#  cd picard
#  gradle shadowJar
#}

#test(){
#  cd picard
#  gradle test
#}

package() {
  #cd picard
  install -Dm755 "${srcdir}/picard-profile.sh"    "${pkgdir}/etc/profile.d/picard.sh"
  install -Dm755 "${srcdir}/picard.sh"            "${pkgdir}/usr/bin/picard"
  install -Dm755 "${srcdir}/picard-tools-${pkgver}.jar"           "${pkgdir}/usr/share/java/picard-tools/picard.jar"
  #install -Dm755 "${srcdir}/build/libs/picard.jar" "${pkgdir}/usr/share/java/picard-tools/picard.jar"
}

