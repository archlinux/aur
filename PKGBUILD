# Maintainer: Nikita Bobko <echo bmlraXRhYm9ia29AZ21haWwuY29tCg== | base64 -d>

pkgname=gradle-zsh-completion
pkgdesc="zsh completion for Gradle"
pkgver=master_fa72b79
pkgrel=1
arch=("any")
url="https://github.com/gradle/gradle-completion"
license=("MIT")
makedepends=('git')
source=('git+https://github.com/gradle/gradle-completion.git')
md5sums=('SKIP')

package() {
    cd gradle-completion || return 1
    # It must be git checkout "v$pkgver". But they not released yet commit 
    # which includes zsh support. So using version from particular commit
    git checkout fa72b79 >/dev/null 2>&1 || return 1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 gradle-completion.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/${pkgname}/gradle-completion.plugin.zsh"
    install -Dm644 _gradle "${pkgdir}/usr/share/zsh/site-functions/_gradle"
}
