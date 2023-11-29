# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=resticctl
pkgver=1.0
pkgrel=1
pkgdesc='A simple restic helper'
arch=('any')
url='https://gitlab.com/connectical/connectical-infrastructure'
license=('GPL3')
depends=('bash' 'restic')
optdepends=('fuse2: mount archive')
backup=("etc/${pkgname}/${pkgname}.conf" "etc/${pkgname}/excludes.lst")
source=("${pkgname}"
        "${pkgname}.conf"
        "excludes.lst"
        "README.md")
b2sums=('2630c048240c486a1b6799e370e43479f21b50358399898a408424d8792e5d8889a54ce5308d04239bfb666b47808d81e387c812ddd53589a13214cb7694a3af'
        '3aaaf7540dfd08d72314e6b529e65da1526074a6e7202b03bd7f4032c40d97649cb27068eacb42b25207989ab4f8a3610f1d359085c5e752817c5bd7d234c720'
        'c46662405929ab6961d11577b5469433e269e2c5744e4a052fd48791a6ec188625c07bd46ef053534608d04f6902ee9138c32c4252615d8a0d849f287d47b013'
        'c695db491e72ad896cb90342cfd10bb381ec0eb5f11c77cb81803a7550c6acb2492ac9d4fb27eb024e3772250ba5b4d48da0cf4b770cb3ff163ba9a6b966aed2')

package() {
  # binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # conf
  install -Dm600 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm644 excludes.lst "${pkgdir}/etc/${pkgname}/excludes.lst"
  # doc
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
