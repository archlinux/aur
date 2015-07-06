# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=php-codesniffer-symfony2-git
pkgver=r58.d4e4794
pkgrel=1
epoch=2
pkgdesc="Symfony2 coding standard for PHP Code Sniffer."
arch=('any')
url="https://github.com/escapestudios/Symfony2-coding-standard"
license=('unknown')
depends=('php-codesniffer')
makedepends=('git')
provides=('php-codesniffer-symfony2')
conflicts=('php-codesniffer-symfony2')
source=('git://github.com/escapestudios/Symfony2-coding-standard')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Symfony2-coding-standard"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/Symfony2-coding-standard/Symfony2"
  install -Dm0644 ruleset.xml "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/ruleset.xml

  # Arrays
  install -Dm0644 Sniffs/Arrays/MultiLineArrayCommaSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Arrays/MultiLineArrayCommaSniff.php

  # Classes
  install -Dm0644 Sniffs/Classes/MultipleClassesOneFileSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Classes/MultipleClassesOneFileSniff.php
  install -Dm0644 Sniffs/Classes/PropertyDeclarationSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Classes/PropertyDeclarationSniff.php

  # Commenting
  install -Dm0644 Sniffs/Commenting/ClassCommentSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Commenting/ClassCommentSniff.php
  install -Dm0644 Sniffs/Commenting/FunctionCommentSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Commenting/FunctionCommentSniff.php

  # Formatting
  install -Dm0644 Sniffs/Formatting/BlankLineBeforeReturnSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Formatting/BlankLineBeforeReturnSniff.php

  # Functions
  install -Dm0644 Sniffs/Functions/ScopeOrderSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Functions/ScopeOrderSniff.php

  # Naming Conventions
  install -Dm0644 Sniffs/NamingConventions/ValidClassNameSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/NamingConventions/ValidClassNameSniff.php

  # Objects
  install -Dm0644 Sniffs/Objects/ObjectInstantiationSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Objects/ObjectInstantiationSniff.php

  # Scope
  install -Dm0644 Sniffs/Scope/MethodScopeSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/Sniffs/Scope/MethodScopeSniff.php

  # Whitespace
  install -Dm0644 Sniffs/WhiteSpace/BinaryOperatorSpacingSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/WhiteSpace/BinaryOperatorSpacingSniff.php
  install -Dm0644 Sniffs/WhiteSpace/CommaSpacingSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/WhiteSpace/CommaSpacingSniff.php
  install -Dm0644 Sniffs/WhiteSpace/DiscourageFitzinatorSniff.php "$pkgdir"/usr/share/pear/PHP/CodeSniffer/Standards/Symfony2/WhiteSpace/DiscourageFitzinatorSniff.php
}
