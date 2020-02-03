# Maintainer: Nikita Bobko <echo bmlraXRhYm9ia29AZ21haWwuY29tCg== | base64 -d>

pkgname=gradle-zsh-completion
pkgdesc="ZSH completion for Gradle"
pkgver=master_fa72b79
pkgrel=2
arch=("any")
url="https://github.com/gradle/gradle-completion"
license=("MIT")
makedepends=('git')
source=('git+https://github.com/gradle/gradle-completion.git')
md5sums=('SKIP')

package() {
    cd gradle-completion || return 1
    # It must be git checkout "v$pkgver".
    # But package creators have not released commit which includes zsh support yet.
    # So use fa72b79 commit here.
    git checkout fa72b79 >/dev/null 2>&1 || return 1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 gradle-completion.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/${pkgname}/gradle-completion.plugin.zsh"
    install -Dm644 _gradle "${pkgdir}/usr/share/zsh/site-functions/_gradle"
}
