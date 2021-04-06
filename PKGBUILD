pkgname=code-icons
pkgver=1.54.3
pkgrel=1
pkgdesc='Change Code OSS icons to VSCode ones'
arch=('any')
license=('unknown')
depends=('code')
install="${pkgname}.install"
source=("${pkgname}.hook"
        'patch.sh'
        'visual-studio-code.png'
        'letterpress.svg'
        'letterpress-dark.svg'
        'letterpress-hc.svg')
md5sums=('4daa6413b80f92c531fd769515475b5c'
         '3bcb7eee753afe0261d246a4323cda42'
         '04c4c453a76effa2d794fd6037fb1412'
         'fcae93243f3d0c408707711b833e408f'
         '0c284b5816605c2c3fb9d24b88b759b9'
         '0fb6c6b3251e012cee655ee300402029')


package() {
  install -Dm 644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm 755 "${srcdir}/patch.sh" "${pkgdir}/usr/share/${pkgname}/patch.sh"
  install -Dm 755 "${srcdir}"/visual-studio-code.png "${pkgdir}"/usr/share/${pkgname}/visual-studio-code.png
  install -Dm 755 "${srcdir}"/letterpress.svg "${pkgdir}"/usr/share/${pkgname}/letterpress.svg
  install -Dm 755 "${srcdir}"/letterpress-dark.svg "${pkgdir}"/usr/share/${pkgname}/letterpress-dark.svg
  install -Dm 755 "${srcdir}"/letterpress-hc.svg "${pkgdir}"/usr/share/${pkgname}/letterpress-hc.svg
}
