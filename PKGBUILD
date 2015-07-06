pkgname=git-flow-completion-git
pkgver=0.4.2.2.a467274
pkgrel=1
pkgdesc='git-flow shell completions'
arch=('any')
url='http://github.com/bobthecow/git-flow-completion'
license=('MIT')
depends=('gitflow-git')
 
_gitname='git-flow-completion'
source=(git://github.com/bobthecow/${_gitname}.git)
md5sums=('SKIP')
 
pkgver() {
    cd $_gitname
      echo $(git describe --tags).$(git rev-parse --short master)
    }
     
    package() {
        cd "$_gitname"
          install -D -m644 git-flow-completion.bash $pkgdir/etc/bash_completion.d/git-flow-completion.bash
            install -D -m644 git-flow-completion.zsh $pkgdir/usr/share/git-flow/git-flow-completion.zsh
              install -D -m644 git.fish $pkgdir/usr/share/fish/completions/git-flow.fish
                install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
              }
              

